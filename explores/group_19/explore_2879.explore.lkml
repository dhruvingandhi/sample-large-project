# Explore: explore_2879
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08638.view.lkml"
include: "/views/domain_40/view_08640.view.lkml"
include: "/views/domain_41/view_08641.view.lkml"
include: "/views/domain_42/view_08642.view.lkml"

explore: explore_2879 {
  label: "Explore Explore 2879"
  description: "Comprehensive analytics explore joining base view_08638 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08638
  
  always_filter: {
    filters: [view_08638.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08638.created_at_date: "7 days"]
    unless: [view_08638.id, view_08638.status]
  }

  join: view_08640 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08638.user_id} = ${view_08640.id} ;;
    required_joins: []
  }

  join: view_08641 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08638.account_id} = ${view_08641.account_id} ;;
    required_joins: [view_08640]
  }

  join: view_08642 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08638.category} = ${view_08642.category} ;;
  }

  access_filter: {
    field: view_08638.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08638.is_deleted} = false ;;
}
