# Explore: explore_1646
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04939.view.lkml"
include: "/views/domain_41/view_04941.view.lkml"
include: "/views/domain_42/view_04942.view.lkml"
include: "/views/domain_43/view_04943.view.lkml"

explore: explore_1646 {
  label: "Explore Explore 1646"
  description: "Comprehensive analytics explore joining base view_04939 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04939
  
  always_filter: {
    filters: [view_04939.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04939.created_at_date: "7 days"]
    unless: [view_04939.id, view_04939.status]
  }

  join: view_04941 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04939.user_id} = ${view_04941.id} ;;
    required_joins: []
  }

  join: view_04942 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04939.account_id} = ${view_04942.account_id} ;;
    required_joins: [view_04941]
  }

  join: view_04943 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04939.category} = ${view_04943.category} ;;
  }

  access_filter: {
    field: view_04939.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04939.is_deleted} = false ;;
}
