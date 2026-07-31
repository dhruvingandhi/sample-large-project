# Update for 2000 file diff target
# Explore: explore_2080
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06241.view.lkml"
include: "/views/domain_43/view_06243.view.lkml"
include: "/views/domain_44/view_06244.view.lkml"
include: "/views/domain_45/view_06245.view.lkml"

explore: explore_2080 {
  label: "Explore Explore 2080"
  description: "Comprehensive analytics explore joining base view_06241 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06241
  
  always_filter: {
    filters: [view_06241.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06241.created_at_date: "7 days"]
    unless: [view_06241.id, view_06241.status]
  }

  join: view_06243 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06241.user_id} = ${view_06243.id} ;;
    required_joins: []
  }

  join: view_06244 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06241.account_id} = ${view_06244.account_id} ;;
    required_joins: [view_06243]
  }

  join: view_06245 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06241.category} = ${view_06245.category} ;;
  }

  access_filter: {
    field: view_06241.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06241.is_deleted} = false ;;
}
