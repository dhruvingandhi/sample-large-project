# Explore: explore_3073
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09220.view.lkml"
include: "/views/domain_22/view_09222.view.lkml"
include: "/views/domain_23/view_09223.view.lkml"
include: "/views/domain_24/view_09224.view.lkml"

explore: explore_3073 {
  label: "Explore Explore 3073"
  description: "Comprehensive analytics explore joining base view_09220 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09220
  
  always_filter: {
    filters: [view_09220.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09220.created_at_date: "7 days"]
    unless: [view_09220.id, view_09220.status]
  }

  join: view_09222 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09220.user_id} = ${view_09222.id} ;;
    required_joins: []
  }

  join: view_09223 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09220.account_id} = ${view_09223.account_id} ;;
    required_joins: [view_09222]
  }

  join: view_09224 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09220.category} = ${view_09224.category} ;;
  }

  access_filter: {
    field: view_09220.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09220.is_deleted} = false ;;
}
