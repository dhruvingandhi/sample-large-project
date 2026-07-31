# Antigravity modified: branch dg-3
# Explore: explore_0745
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02236.view.lkml"
include: "/views/domain_38/view_02238.view.lkml"
include: "/views/domain_39/view_02239.view.lkml"
include: "/views/domain_40/view_02240.view.lkml"

explore: explore_0745 {
  label: "Explore Explore 0745"
  description: "Comprehensive analytics explore joining base view_02236 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02236
  
  always_filter: {
    filters: [view_02236.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02236.created_at_date: "7 days"]
    unless: [view_02236.id, view_02236.status]
  }

  join: view_02238 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02236.user_id} = ${view_02238.id} ;;
    required_joins: []
  }

  join: view_02239 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02236.account_id} = ${view_02239.account_id} ;;
    required_joins: [view_02238]
  }

  join: view_02240 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02236.category} = ${view_02240.category} ;;
  }

  access_filter: {
    field: view_02236.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02236.is_deleted} = false ;;
}
