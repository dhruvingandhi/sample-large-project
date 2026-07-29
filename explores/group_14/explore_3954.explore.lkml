# Explore: explore_3954
# Auto-generated LookML Explore File

include: "/views/domain_13/view_11863.view.lkml"
include: "/views/domain_15/view_11865.view.lkml"
include: "/views/domain_16/view_11866.view.lkml"
include: "/views/domain_17/view_11867.view.lkml"

explore: explore_3954 {
  label: "Explore Explore 3954"
  description: "Comprehensive analytics explore joining base view_11863 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11863
  
  always_filter: {
    filters: [view_11863.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11863.created_at_date: "7 days"]
    unless: [view_11863.id, view_11863.status]
  }

  join: view_11865 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11863.user_id} = ${view_11865.id} ;;
    required_joins: []
  }

  join: view_11866 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11863.account_id} = ${view_11866.account_id} ;;
    required_joins: [view_11865]
  }

  join: view_11867 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11863.category} = ${view_11867.category} ;;
  }

  access_filter: {
    field: view_11863.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11863.is_deleted} = false ;;
}
