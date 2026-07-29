# Explore: explore_1715
# Auto-generated LookML Explore File

include: "/views/domain_46/view_05146.view.lkml"
include: "/views/domain_48/view_05148.view.lkml"
include: "/views/domain_49/view_05149.view.lkml"
include: "/views/domain_50/view_05150.view.lkml"

explore: explore_1715 {
  label: "Explore Explore 1715"
  description: "Comprehensive analytics explore joining base view_05146 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05146
  
  always_filter: {
    filters: [view_05146.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05146.created_at_date: "7 days"]
    unless: [view_05146.id, view_05146.status]
  }

  join: view_05148 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05146.user_id} = ${view_05148.id} ;;
    required_joins: []
  }

  join: view_05149 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05146.account_id} = ${view_05149.account_id} ;;
    required_joins: [view_05148]
  }

  join: view_05150 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05146.category} = ${view_05150.category} ;;
  }

  access_filter: {
    field: view_05146.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05146.is_deleted} = false ;;
}
