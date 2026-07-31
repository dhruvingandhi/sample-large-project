# Antigravity modified: branch dg-3
# Explore: explore_0945
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02836.view.lkml"
include: "/views/domain_38/view_02838.view.lkml"
include: "/views/domain_39/view_02839.view.lkml"
include: "/views/domain_40/view_02840.view.lkml"

explore: explore_0945 {
  label: "Explore Explore 0945"
  description: "Comprehensive analytics explore joining base view_02836 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02836
  
  always_filter: {
    filters: [view_02836.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02836.created_at_date: "7 days"]
    unless: [view_02836.id, view_02836.status]
  }

  join: view_02838 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02836.user_id} = ${view_02838.id} ;;
    required_joins: []
  }

  join: view_02839 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02836.account_id} = ${view_02839.account_id} ;;
    required_joins: [view_02838]
  }

  join: view_02840 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02836.category} = ${view_02840.category} ;;
  }

  access_filter: {
    field: view_02836.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02836.is_deleted} = false ;;
}
