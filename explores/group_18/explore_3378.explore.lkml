# Update for 2000 file diff target
# Explore: explore_3378
# Auto-generated LookML Explore File

include: "/views/domain_35/view_10135.view.lkml"
include: "/views/domain_37/view_10137.view.lkml"
include: "/views/domain_38/view_10138.view.lkml"
include: "/views/domain_39/view_10139.view.lkml"

explore: explore_3378 {
  label: "Explore Explore 3378"
  description: "Comprehensive analytics explore joining base view_10135 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10135
  
  always_filter: {
    filters: [view_10135.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10135.created_at_date: "7 days"]
    unless: [view_10135.id, view_10135.status]
  }

  join: view_10137 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10135.user_id} = ${view_10137.id} ;;
    required_joins: []
  }

  join: view_10138 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10135.account_id} = ${view_10138.account_id} ;;
    required_joins: [view_10137]
  }

  join: view_10139 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10135.category} = ${view_10139.category} ;;
  }

  access_filter: {
    field: view_10135.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10135.is_deleted} = false ;;
}
