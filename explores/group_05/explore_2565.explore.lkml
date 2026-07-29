# Explore: explore_2565
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07696.view.lkml"
include: "/views/domain_48/view_07698.view.lkml"
include: "/views/domain_49/view_07699.view.lkml"
include: "/views/domain_50/view_07700.view.lkml"

explore: explore_2565 {
  label: "Explore Explore 2565"
  description: "Comprehensive analytics explore joining base view_07696 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07696
  
  always_filter: {
    filters: [view_07696.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07696.created_at_date: "7 days"]
    unless: [view_07696.id, view_07696.status]
  }

  join: view_07698 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07696.user_id} = ${view_07698.id} ;;
    required_joins: []
  }

  join: view_07699 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07696.account_id} = ${view_07699.account_id} ;;
    required_joins: [view_07698]
  }

  join: view_07700 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07696.category} = ${view_07700.category} ;;
  }

  access_filter: {
    field: view_07696.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07696.is_deleted} = false ;;
}
