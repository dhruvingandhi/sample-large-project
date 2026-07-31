# Update for 500 file diff target
# Explore: explore_1565
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04696.view.lkml"
include: "/views/domain_48/view_04698.view.lkml"
include: "/views/domain_49/view_04699.view.lkml"
include: "/views/domain_50/view_04700.view.lkml"

explore: explore_1565 {
  label: "Explore Explore 1565"
  description: "Comprehensive analytics explore joining base view_04696 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04696
  
  always_filter: {
    filters: [view_04696.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04696.created_at_date: "7 days"]
    unless: [view_04696.id, view_04696.status]
  }

  join: view_04698 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04696.user_id} = ${view_04698.id} ;;
    required_joins: []
  }

  join: view_04699 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04696.account_id} = ${view_04699.account_id} ;;
    required_joins: [view_04698]
  }

  join: view_04700 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04696.category} = ${view_04700.category} ;;
  }

  access_filter: {
    field: view_04696.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04696.is_deleted} = false ;;
}
