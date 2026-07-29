# Explore: explore_2513
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07540.view.lkml"
include: "/views/domain_42/view_07542.view.lkml"
include: "/views/domain_43/view_07543.view.lkml"
include: "/views/domain_44/view_07544.view.lkml"

explore: explore_2513 {
  label: "Explore Explore 2513"
  description: "Comprehensive analytics explore joining base view_07540 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07540
  
  always_filter: {
    filters: [view_07540.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07540.created_at_date: "7 days"]
    unless: [view_07540.id, view_07540.status]
  }

  join: view_07542 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07540.user_id} = ${view_07542.id} ;;
    required_joins: []
  }

  join: view_07543 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07540.account_id} = ${view_07543.account_id} ;;
    required_joins: [view_07542]
  }

  join: view_07544 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07540.category} = ${view_07544.category} ;;
  }

  access_filter: {
    field: view_07540.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07540.is_deleted} = false ;;
}
