# Explore: explore_1621
# Auto-generated LookML Explore File

include: "/views/domain_14/view_04864.view.lkml"
include: "/views/domain_16/view_04866.view.lkml"
include: "/views/domain_17/view_04867.view.lkml"
include: "/views/domain_18/view_04868.view.lkml"

explore: explore_1621 {
  label: "Explore Explore 1621"
  description: "Comprehensive analytics explore joining base view_04864 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04864
  
  always_filter: {
    filters: [view_04864.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04864.created_at_date: "7 days"]
    unless: [view_04864.id, view_04864.status]
  }

  join: view_04866 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04864.user_id} = ${view_04866.id} ;;
    required_joins: []
  }

  join: view_04867 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04864.account_id} = ${view_04867.account_id} ;;
    required_joins: [view_04866]
  }

  join: view_04868 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04864.category} = ${view_04868.category} ;;
  }

  access_filter: {
    field: view_04864.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04864.is_deleted} = false ;;
}
