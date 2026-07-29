# Explore: explore_3672
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11017.view.lkml"
include: "/views/domain_19/view_11019.view.lkml"
include: "/views/domain_20/view_11020.view.lkml"
include: "/views/domain_21/view_11021.view.lkml"

explore: explore_3672 {
  label: "Explore Explore 3672"
  description: "Comprehensive analytics explore joining base view_11017 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11017
  
  always_filter: {
    filters: [view_11017.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11017.created_at_date: "7 days"]
    unless: [view_11017.id, view_11017.status]
  }

  join: view_11019 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11017.user_id} = ${view_11019.id} ;;
    required_joins: []
  }

  join: view_11020 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11017.account_id} = ${view_11020.account_id} ;;
    required_joins: [view_11019]
  }

  join: view_11021 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11017.category} = ${view_11021.category} ;;
  }

  access_filter: {
    field: view_11017.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11017.is_deleted} = false ;;
}
