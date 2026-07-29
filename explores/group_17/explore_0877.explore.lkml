# Explore: explore_0877
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02632.view.lkml"
include: "/views/domain_34/view_02634.view.lkml"
include: "/views/domain_35/view_02635.view.lkml"
include: "/views/domain_36/view_02636.view.lkml"

explore: explore_0877 {
  label: "Explore Explore 0877"
  description: "Comprehensive analytics explore joining base view_02632 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02632
  
  always_filter: {
    filters: [view_02632.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02632.created_at_date: "7 days"]
    unless: [view_02632.id, view_02632.status]
  }

  join: view_02634 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02632.user_id} = ${view_02634.id} ;;
    required_joins: []
  }

  join: view_02635 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02632.account_id} = ${view_02635.account_id} ;;
    required_joins: [view_02634]
  }

  join: view_02636 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02632.category} = ${view_02636.category} ;;
  }

  access_filter: {
    field: view_02632.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02632.is_deleted} = false ;;
}
