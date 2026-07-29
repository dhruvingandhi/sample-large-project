# Explore: explore_1620
# Auto-generated LookML Explore File

include: "/views/domain_11/view_04861.view.lkml"
include: "/views/domain_13/view_04863.view.lkml"
include: "/views/domain_14/view_04864.view.lkml"
include: "/views/domain_15/view_04865.view.lkml"

explore: explore_1620 {
  label: "Explore Explore 1620"
  description: "Comprehensive analytics explore joining base view_04861 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04861
  
  always_filter: {
    filters: [view_04861.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04861.created_at_date: "7 days"]
    unless: [view_04861.id, view_04861.status]
  }

  join: view_04863 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04861.user_id} = ${view_04863.id} ;;
    required_joins: []
  }

  join: view_04864 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04861.account_id} = ${view_04864.account_id} ;;
    required_joins: [view_04863]
  }

  join: view_04865 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04861.category} = ${view_04865.category} ;;
  }

  access_filter: {
    field: view_04861.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04861.is_deleted} = false ;;
}
