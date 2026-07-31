# Update for 500 file diff target
# Explore: explore_1545
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04636.view.lkml"
include: "/views/domain_38/view_04638.view.lkml"
include: "/views/domain_39/view_04639.view.lkml"
include: "/views/domain_40/view_04640.view.lkml"

explore: explore_1545 {
  label: "Explore Explore 1545"
  description: "Comprehensive analytics explore joining base view_04636 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04636
  
  always_filter: {
    filters: [view_04636.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04636.created_at_date: "7 days"]
    unless: [view_04636.id, view_04636.status]
  }

  join: view_04638 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04636.user_id} = ${view_04638.id} ;;
    required_joins: []
  }

  join: view_04639 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04636.account_id} = ${view_04639.account_id} ;;
    required_joins: [view_04638]
  }

  join: view_04640 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04636.category} = ${view_04640.category} ;;
  }

  access_filter: {
    field: view_04636.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04636.is_deleted} = false ;;
}
