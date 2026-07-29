# Explore: explore_0686
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02059.view.lkml"
include: "/views/domain_11/view_02061.view.lkml"
include: "/views/domain_12/view_02062.view.lkml"
include: "/views/domain_13/view_02063.view.lkml"

explore: explore_0686 {
  label: "Explore Explore 0686"
  description: "Comprehensive analytics explore joining base view_02059 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02059
  
  always_filter: {
    filters: [view_02059.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02059.created_at_date: "7 days"]
    unless: [view_02059.id, view_02059.status]
  }

  join: view_02061 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02059.user_id} = ${view_02061.id} ;;
    required_joins: []
  }

  join: view_02062 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02059.account_id} = ${view_02062.account_id} ;;
    required_joins: [view_02061]
  }

  join: view_02063 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02059.category} = ${view_02063.category} ;;
  }

  access_filter: {
    field: view_02059.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02059.is_deleted} = false ;;
}
