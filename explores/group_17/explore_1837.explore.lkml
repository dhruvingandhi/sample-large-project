# Explore: explore_1837
# Auto-generated LookML Explore File

include: "/views/domain_12/view_05512.view.lkml"
include: "/views/domain_14/view_05514.view.lkml"
include: "/views/domain_15/view_05515.view.lkml"
include: "/views/domain_16/view_05516.view.lkml"

explore: explore_1837 {
  label: "Explore Explore 1837"
  description: "Comprehensive analytics explore joining base view_05512 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05512
  
  always_filter: {
    filters: [view_05512.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05512.created_at_date: "7 days"]
    unless: [view_05512.id, view_05512.status]
  }

  join: view_05514 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05512.user_id} = ${view_05514.id} ;;
    required_joins: []
  }

  join: view_05515 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05512.account_id} = ${view_05515.account_id} ;;
    required_joins: [view_05514]
  }

  join: view_05516 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05512.category} = ${view_05516.category} ;;
  }

  access_filter: {
    field: view_05512.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05512.is_deleted} = false ;;
}
