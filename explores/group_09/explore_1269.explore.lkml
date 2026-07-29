# Explore: explore_1269
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03808.view.lkml"
include: "/views/domain_10/view_03810.view.lkml"
include: "/views/domain_11/view_03811.view.lkml"
include: "/views/domain_12/view_03812.view.lkml"

explore: explore_1269 {
  label: "Explore Explore 1269"
  description: "Comprehensive analytics explore joining base view_03808 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03808
  
  always_filter: {
    filters: [view_03808.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03808.created_at_date: "7 days"]
    unless: [view_03808.id, view_03808.status]
  }

  join: view_03810 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03808.user_id} = ${view_03810.id} ;;
    required_joins: []
  }

  join: view_03811 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03808.account_id} = ${view_03811.account_id} ;;
    required_joins: [view_03810]
  }

  join: view_03812 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03808.category} = ${view_03812.category} ;;
  }

  access_filter: {
    field: view_03808.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03808.is_deleted} = false ;;
}
