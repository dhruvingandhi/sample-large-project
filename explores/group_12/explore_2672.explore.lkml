# Explore: explore_2672
# Auto-generated LookML Explore File

include: "/views/domain_17/view_08017.view.lkml"
include: "/views/domain_19/view_08019.view.lkml"
include: "/views/domain_20/view_08020.view.lkml"
include: "/views/domain_21/view_08021.view.lkml"

explore: explore_2672 {
  label: "Explore Explore 2672"
  description: "Comprehensive analytics explore joining base view_08017 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08017
  
  always_filter: {
    filters: [view_08017.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08017.created_at_date: "7 days"]
    unless: [view_08017.id, view_08017.status]
  }

  join: view_08019 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08017.user_id} = ${view_08019.id} ;;
    required_joins: []
  }

  join: view_08020 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08017.account_id} = ${view_08020.account_id} ;;
    required_joins: [view_08019]
  }

  join: view_08021 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08017.category} = ${view_08021.category} ;;
  }

  access_filter: {
    field: view_08017.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08017.is_deleted} = false ;;
}
