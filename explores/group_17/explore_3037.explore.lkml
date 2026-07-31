# Update for 2000 file diff target
# Explore: explore_3037
# Auto-generated LookML Explore File

include: "/views/domain_12/view_09112.view.lkml"
include: "/views/domain_14/view_09114.view.lkml"
include: "/views/domain_15/view_09115.view.lkml"
include: "/views/domain_16/view_09116.view.lkml"

explore: explore_3037 {
  label: "Explore Explore 3037"
  description: "Comprehensive analytics explore joining base view_09112 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09112
  
  always_filter: {
    filters: [view_09112.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09112.created_at_date: "7 days"]
    unless: [view_09112.id, view_09112.status]
  }

  join: view_09114 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09112.user_id} = ${view_09114.id} ;;
    required_joins: []
  }

  join: view_09115 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09112.account_id} = ${view_09115.account_id} ;;
    required_joins: [view_09114]
  }

  join: view_09116 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09112.category} = ${view_09116.category} ;;
  }

  access_filter: {
    field: view_09112.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09112.is_deleted} = false ;;
}
