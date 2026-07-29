# Explore: explore_1596
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04789.view.lkml"
include: "/views/domain_41/view_04791.view.lkml"
include: "/views/domain_42/view_04792.view.lkml"
include: "/views/domain_43/view_04793.view.lkml"

explore: explore_1596 {
  label: "Explore Explore 1596"
  description: "Comprehensive analytics explore joining base view_04789 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04789
  
  always_filter: {
    filters: [view_04789.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04789.created_at_date: "7 days"]
    unless: [view_04789.id, view_04789.status]
  }

  join: view_04791 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04789.user_id} = ${view_04791.id} ;;
    required_joins: []
  }

  join: view_04792 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04789.account_id} = ${view_04792.account_id} ;;
    required_joins: [view_04791]
  }

  join: view_04793 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04789.category} = ${view_04793.category} ;;
  }

  access_filter: {
    field: view_04789.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04789.is_deleted} = false ;;
}
