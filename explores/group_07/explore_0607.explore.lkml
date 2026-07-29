# Explore: explore_0607
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01822.view.lkml"
include: "/views/domain_24/view_01824.view.lkml"
include: "/views/domain_25/view_01825.view.lkml"
include: "/views/domain_26/view_01826.view.lkml"

explore: explore_0607 {
  label: "Explore Explore 0607"
  description: "Comprehensive analytics explore joining base view_01822 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01822
  
  always_filter: {
    filters: [view_01822.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01822.created_at_date: "7 days"]
    unless: [view_01822.id, view_01822.status]
  }

  join: view_01824 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01822.user_id} = ${view_01824.id} ;;
    required_joins: []
  }

  join: view_01825 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01822.account_id} = ${view_01825.account_id} ;;
    required_joins: [view_01824]
  }

  join: view_01826 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01822.category} = ${view_01826.category} ;;
  }

  access_filter: {
    field: view_01822.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01822.is_deleted} = false ;;
}
