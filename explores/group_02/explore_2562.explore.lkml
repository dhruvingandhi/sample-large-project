# Explore: explore_2562
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07687.view.lkml"
include: "/views/domain_39/view_07689.view.lkml"
include: "/views/domain_40/view_07690.view.lkml"
include: "/views/domain_41/view_07691.view.lkml"

explore: explore_2562 {
  label: "Explore Explore 2562"
  description: "Comprehensive analytics explore joining base view_07687 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07687
  
  always_filter: {
    filters: [view_07687.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07687.created_at_date: "7 days"]
    unless: [view_07687.id, view_07687.status]
  }

  join: view_07689 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07687.user_id} = ${view_07689.id} ;;
    required_joins: []
  }

  join: view_07690 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07687.account_id} = ${view_07690.account_id} ;;
    required_joins: [view_07689]
  }

  join: view_07691 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07687.category} = ${view_07691.category} ;;
  }

  access_filter: {
    field: view_07687.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07687.is_deleted} = false ;;
}
