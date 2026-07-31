# Update for 2000 file diff target
# Explore: explore_3039
# Auto-generated LookML Explore File

include: "/views/domain_18/view_09118.view.lkml"
include: "/views/domain_20/view_09120.view.lkml"
include: "/views/domain_21/view_09121.view.lkml"
include: "/views/domain_22/view_09122.view.lkml"

explore: explore_3039 {
  label: "Explore Explore 3039"
  description: "Comprehensive analytics explore joining base view_09118 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09118
  
  always_filter: {
    filters: [view_09118.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09118.created_at_date: "7 days"]
    unless: [view_09118.id, view_09118.status]
  }

  join: view_09120 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09118.user_id} = ${view_09120.id} ;;
    required_joins: []
  }

  join: view_09121 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09118.account_id} = ${view_09121.account_id} ;;
    required_joins: [view_09120]
  }

  join: view_09122 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09118.category} = ${view_09122.category} ;;
  }

  access_filter: {
    field: view_09118.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09118.is_deleted} = false ;;
}
