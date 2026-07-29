# Explore: explore_1641
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04924.view.lkml"
include: "/views/domain_26/view_04926.view.lkml"
include: "/views/domain_27/view_04927.view.lkml"
include: "/views/domain_28/view_04928.view.lkml"

explore: explore_1641 {
  label: "Explore Explore 1641"
  description: "Comprehensive analytics explore joining base view_04924 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04924
  
  always_filter: {
    filters: [view_04924.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04924.created_at_date: "7 days"]
    unless: [view_04924.id, view_04924.status]
  }

  join: view_04926 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04924.user_id} = ${view_04926.id} ;;
    required_joins: []
  }

  join: view_04927 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04924.account_id} = ${view_04927.account_id} ;;
    required_joins: [view_04926]
  }

  join: view_04928 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04924.category} = ${view_04928.category} ;;
  }

  access_filter: {
    field: view_04924.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04924.is_deleted} = false ;;
}
