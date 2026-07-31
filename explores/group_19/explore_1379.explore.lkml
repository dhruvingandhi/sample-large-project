# Update for 2000 file diff target
# Explore: explore_1379
# Auto-generated LookML Explore File

include: "/views/domain_38/view_04138.view.lkml"
include: "/views/domain_40/view_04140.view.lkml"
include: "/views/domain_41/view_04141.view.lkml"
include: "/views/domain_42/view_04142.view.lkml"

explore: explore_1379 {
  label: "Explore Explore 1379"
  description: "Comprehensive analytics explore joining base view_04138 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04138
  
  always_filter: {
    filters: [view_04138.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04138.created_at_date: "7 days"]
    unless: [view_04138.id, view_04138.status]
  }

  join: view_04140 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04138.user_id} = ${view_04140.id} ;;
    required_joins: []
  }

  join: view_04141 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04138.account_id} = ${view_04141.account_id} ;;
    required_joins: [view_04140]
  }

  join: view_04142 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04138.category} = ${view_04142.category} ;;
  }

  access_filter: {
    field: view_04138.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04138.is_deleted} = false ;;
}
