# Explore: explore_3513
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10540.view.lkml"
include: "/views/domain_42/view_10542.view.lkml"
include: "/views/domain_43/view_10543.view.lkml"
include: "/views/domain_44/view_10544.view.lkml"

explore: explore_3513 {
  label: "Explore Explore 3513"
  description: "Comprehensive analytics explore joining base view_10540 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10540
  
  always_filter: {
    filters: [view_10540.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10540.created_at_date: "7 days"]
    unless: [view_10540.id, view_10540.status]
  }

  join: view_10542 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10540.user_id} = ${view_10542.id} ;;
    required_joins: []
  }

  join: view_10543 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10540.account_id} = ${view_10543.account_id} ;;
    required_joins: [view_10542]
  }

  join: view_10544 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10540.category} = ${view_10544.category} ;;
  }

  access_filter: {
    field: view_10540.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10540.is_deleted} = false ;;
}
