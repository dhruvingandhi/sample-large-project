# Explore: explore_1879
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05638.view.lkml"
include: "/views/domain_40/view_05640.view.lkml"
include: "/views/domain_41/view_05641.view.lkml"
include: "/views/domain_42/view_05642.view.lkml"

explore: explore_1879 {
  label: "Explore Explore 1879"
  description: "Comprehensive analytics explore joining base view_05638 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05638
  
  always_filter: {
    filters: [view_05638.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05638.created_at_date: "7 days"]
    unless: [view_05638.id, view_05638.status]
  }

  join: view_05640 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05638.user_id} = ${view_05640.id} ;;
    required_joins: []
  }

  join: view_05641 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05638.account_id} = ${view_05641.account_id} ;;
    required_joins: [view_05640]
  }

  join: view_05642 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05638.category} = ${view_05642.category} ;;
  }

  access_filter: {
    field: view_05638.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05638.is_deleted} = false ;;
}
