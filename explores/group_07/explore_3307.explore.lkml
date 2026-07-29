# Explore: explore_3307
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09922.view.lkml"
include: "/views/domain_24/view_09924.view.lkml"
include: "/views/domain_25/view_09925.view.lkml"
include: "/views/domain_26/view_09926.view.lkml"

explore: explore_3307 {
  label: "Explore Explore 3307"
  description: "Comprehensive analytics explore joining base view_09922 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09922
  
  always_filter: {
    filters: [view_09922.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09922.created_at_date: "7 days"]
    unless: [view_09922.id, view_09922.status]
  }

  join: view_09924 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09922.user_id} = ${view_09924.id} ;;
    required_joins: []
  }

  join: view_09925 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09922.account_id} = ${view_09925.account_id} ;;
    required_joins: [view_09924]
  }

  join: view_09926 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09922.category} = ${view_09926.category} ;;
  }

  access_filter: {
    field: view_09922.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09922.is_deleted} = false ;;
}
