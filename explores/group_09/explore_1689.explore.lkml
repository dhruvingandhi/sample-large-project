# Explore: explore_1689
# Auto-generated LookML Explore File

include: "/views/domain_18/view_05068.view.lkml"
include: "/views/domain_20/view_05070.view.lkml"
include: "/views/domain_21/view_05071.view.lkml"
include: "/views/domain_22/view_05072.view.lkml"

explore: explore_1689 {
  label: "Explore Explore 1689"
  description: "Comprehensive analytics explore joining base view_05068 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05068
  
  always_filter: {
    filters: [view_05068.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05068.created_at_date: "7 days"]
    unless: [view_05068.id, view_05068.status]
  }

  join: view_05070 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05068.user_id} = ${view_05070.id} ;;
    required_joins: []
  }

  join: view_05071 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05068.account_id} = ${view_05071.account_id} ;;
    required_joins: [view_05070]
  }

  join: view_05072 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05068.category} = ${view_05072.category} ;;
  }

  access_filter: {
    field: view_05068.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05068.is_deleted} = false ;;
}
