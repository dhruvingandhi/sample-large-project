# Explore: explore_0568
# Auto-generated LookML Explore File

include: "/views/domain_05/view_01705.view.lkml"
include: "/views/domain_07/view_01707.view.lkml"
include: "/views/domain_08/view_01708.view.lkml"
include: "/views/domain_09/view_01709.view.lkml"

explore: explore_0568 {
  label: "Explore Explore 0568"
  description: "Comprehensive analytics explore joining base view_01705 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01705
  
  always_filter: {
    filters: [view_01705.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01705.created_at_date: "7 days"]
    unless: [view_01705.id, view_01705.status]
  }

  join: view_01707 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01705.user_id} = ${view_01707.id} ;;
    required_joins: []
  }

  join: view_01708 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01705.account_id} = ${view_01708.account_id} ;;
    required_joins: [view_01707]
  }

  join: view_01709 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01705.category} = ${view_01709.category} ;;
  }

  access_filter: {
    field: view_01705.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01705.is_deleted} = false ;;
}
