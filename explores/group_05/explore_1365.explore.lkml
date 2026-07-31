# Antigravity modified: branch dg-3
# Explore: explore_1365
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04096.view.lkml"
include: "/views/domain_48/view_04098.view.lkml"
include: "/views/domain_49/view_04099.view.lkml"
include: "/views/domain_50/view_04100.view.lkml"

explore: explore_1365 {
  label: "Explore Explore 1365"
  description: "Comprehensive analytics explore joining base view_04096 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04096
  
  always_filter: {
    filters: [view_04096.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04096.created_at_date: "7 days"]
    unless: [view_04096.id, view_04096.status]
  }

  join: view_04098 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04096.user_id} = ${view_04098.id} ;;
    required_joins: []
  }

  join: view_04099 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04096.account_id} = ${view_04099.account_id} ;;
    required_joins: [view_04098]
  }

  join: view_04100 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04096.category} = ${view_04100.category} ;;
  }

  access_filter: {
    field: view_04096.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04096.is_deleted} = false ;;
}
