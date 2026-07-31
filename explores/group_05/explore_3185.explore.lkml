# Update for 500 file diff target
# Explore: explore_3185
# Auto-generated LookML Explore File

include: "/views/domain_06/view_09556.view.lkml"
include: "/views/domain_08/view_09558.view.lkml"
include: "/views/domain_09/view_09559.view.lkml"
include: "/views/domain_10/view_09560.view.lkml"

explore: explore_3185 {
  label: "Explore Explore 3185"
  description: "Comprehensive analytics explore joining base view_09556 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09556
  
  always_filter: {
    filters: [view_09556.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09556.created_at_date: "7 days"]
    unless: [view_09556.id, view_09556.status]
  }

  join: view_09558 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09556.user_id} = ${view_09558.id} ;;
    required_joins: []
  }

  join: view_09559 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09556.account_id} = ${view_09559.account_id} ;;
    required_joins: [view_09558]
  }

  join: view_09560 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09556.category} = ${view_09560.category} ;;
  }

  access_filter: {
    field: view_09556.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09556.is_deleted} = false ;;
}
