# Update for 500 file diff target
# Explore: explore_3845
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11536.view.lkml"
include: "/views/domain_38/view_11538.view.lkml"
include: "/views/domain_39/view_11539.view.lkml"
include: "/views/domain_40/view_11540.view.lkml"

explore: explore_3845 {
  label: "Explore Explore 3845"
  description: "Comprehensive analytics explore joining base view_11536 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11536
  
  always_filter: {
    filters: [view_11536.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11536.created_at_date: "7 days"]
    unless: [view_11536.id, view_11536.status]
  }

  join: view_11538 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11536.user_id} = ${view_11538.id} ;;
    required_joins: []
  }

  join: view_11539 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11536.account_id} = ${view_11539.account_id} ;;
    required_joins: [view_11538]
  }

  join: view_11540 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11536.category} = ${view_11540.category} ;;
  }

  access_filter: {
    field: view_11536.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11536.is_deleted} = false ;;
}
