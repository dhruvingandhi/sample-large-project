# Update for 2000 file diff target
# Explore: explore_1960
# Auto-generated LookML Explore File

include: "/views/domain_31/view_05881.view.lkml"
include: "/views/domain_33/view_05883.view.lkml"
include: "/views/domain_34/view_05884.view.lkml"
include: "/views/domain_35/view_05885.view.lkml"

explore: explore_1960 {
  label: "Explore Explore 1960"
  description: "Comprehensive analytics explore joining base view_05881 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05881
  
  always_filter: {
    filters: [view_05881.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05881.created_at_date: "7 days"]
    unless: [view_05881.id, view_05881.status]
  }

  join: view_05883 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05881.user_id} = ${view_05883.id} ;;
    required_joins: []
  }

  join: view_05884 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05881.account_id} = ${view_05884.account_id} ;;
    required_joins: [view_05883]
  }

  join: view_05885 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05881.category} = ${view_05885.category} ;;
  }

  access_filter: {
    field: view_05881.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05881.is_deleted} = false ;;
}
