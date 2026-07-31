# Update for 2000 file diff target
# Explore: explore_3178
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09535.view.lkml"
include: "/views/domain_37/view_09537.view.lkml"
include: "/views/domain_38/view_09538.view.lkml"
include: "/views/domain_39/view_09539.view.lkml"

explore: explore_3178 {
  label: "Explore Explore 3178"
  description: "Comprehensive analytics explore joining base view_09535 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09535
  
  always_filter: {
    filters: [view_09535.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09535.created_at_date: "7 days"]
    unless: [view_09535.id, view_09535.status]
  }

  join: view_09537 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09535.user_id} = ${view_09537.id} ;;
    required_joins: []
  }

  join: view_09538 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09535.account_id} = ${view_09538.account_id} ;;
    required_joins: [view_09537]
  }

  join: view_09539 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09535.category} = ${view_09539.category} ;;
  }

  access_filter: {
    field: view_09535.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09535.is_deleted} = false ;;
}
