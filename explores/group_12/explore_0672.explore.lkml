# Explore: explore_0672
# Auto-generated LookML Explore File

include: "/views/domain_17/view_02017.view.lkml"
include: "/views/domain_19/view_02019.view.lkml"
include: "/views/domain_20/view_02020.view.lkml"
include: "/views/domain_21/view_02021.view.lkml"

explore: explore_0672 {
  label: "Explore Explore 0672"
  description: "Comprehensive analytics explore joining base view_02017 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02017
  
  always_filter: {
    filters: [view_02017.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02017.created_at_date: "7 days"]
    unless: [view_02017.id, view_02017.status]
  }

  join: view_02019 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02017.user_id} = ${view_02019.id} ;;
    required_joins: []
  }

  join: view_02020 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02017.account_id} = ${view_02020.account_id} ;;
    required_joins: [view_02019]
  }

  join: view_02021 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02017.category} = ${view_02021.category} ;;
  }

  access_filter: {
    field: view_02017.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02017.is_deleted} = false ;;
}
