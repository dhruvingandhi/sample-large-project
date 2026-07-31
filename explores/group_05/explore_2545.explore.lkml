# Update for 500 file diff target
# Explore: explore_2545
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07636.view.lkml"
include: "/views/domain_38/view_07638.view.lkml"
include: "/views/domain_39/view_07639.view.lkml"
include: "/views/domain_40/view_07640.view.lkml"

explore: explore_2545 {
  label: "Explore Explore 2545"
  description: "Comprehensive analytics explore joining base view_07636 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07636
  
  always_filter: {
    filters: [view_07636.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07636.created_at_date: "7 days"]
    unless: [view_07636.id, view_07636.status]
  }

  join: view_07638 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07636.user_id} = ${view_07638.id} ;;
    required_joins: []
  }

  join: view_07639 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07636.account_id} = ${view_07639.account_id} ;;
    required_joins: [view_07638]
  }

  join: view_07640 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07636.category} = ${view_07640.category} ;;
  }

  access_filter: {
    field: view_07636.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07636.is_deleted} = false ;;
}
