# Explore: explore_3464
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10393.view.lkml"
include: "/views/domain_45/view_10395.view.lkml"
include: "/views/domain_46/view_10396.view.lkml"
include: "/views/domain_47/view_10397.view.lkml"

explore: explore_3464 {
  label: "Explore Explore 3464"
  description: "Comprehensive analytics explore joining base view_10393 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10393
  
  always_filter: {
    filters: [view_10393.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10393.created_at_date: "7 days"]
    unless: [view_10393.id, view_10393.status]
  }

  join: view_10395 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10393.user_id} = ${view_10395.id} ;;
    required_joins: []
  }

  join: view_10396 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10393.account_id} = ${view_10396.account_id} ;;
    required_joins: [view_10395]
  }

  join: view_10397 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10393.category} = ${view_10397.category} ;;
  }

  access_filter: {
    field: view_10393.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10393.is_deleted} = false ;;
}
