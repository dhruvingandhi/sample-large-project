# Explore: explore_3627
# Auto-generated LookML Explore File

include: "/views/domain_32/view_10882.view.lkml"
include: "/views/domain_34/view_10884.view.lkml"
include: "/views/domain_35/view_10885.view.lkml"
include: "/views/domain_36/view_10886.view.lkml"

explore: explore_3627 {
  label: "Explore Explore 3627"
  description: "Comprehensive analytics explore joining base view_10882 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10882
  
  always_filter: {
    filters: [view_10882.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10882.created_at_date: "7 days"]
    unless: [view_10882.id, view_10882.status]
  }

  join: view_10884 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10882.user_id} = ${view_10884.id} ;;
    required_joins: []
  }

  join: view_10885 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10882.account_id} = ${view_10885.account_id} ;;
    required_joins: [view_10884]
  }

  join: view_10886 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10882.category} = ${view_10886.category} ;;
  }

  access_filter: {
    field: view_10882.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10882.is_deleted} = false ;;
}
