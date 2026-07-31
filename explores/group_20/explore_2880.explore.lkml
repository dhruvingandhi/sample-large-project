# Update for 2000 file diff target
# Explore: explore_2880
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08641.view.lkml"
include: "/views/domain_43/view_08643.view.lkml"
include: "/views/domain_44/view_08644.view.lkml"
include: "/views/domain_45/view_08645.view.lkml"

explore: explore_2880 {
  label: "Explore Explore 2880"
  description: "Comprehensive analytics explore joining base view_08641 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08641
  
  always_filter: {
    filters: [view_08641.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08641.created_at_date: "7 days"]
    unless: [view_08641.id, view_08641.status]
  }

  join: view_08643 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08641.user_id} = ${view_08643.id} ;;
    required_joins: []
  }

  join: view_08644 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08641.account_id} = ${view_08644.account_id} ;;
    required_joins: [view_08643]
  }

  join: view_08645 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08641.category} = ${view_08645.category} ;;
  }

  access_filter: {
    field: view_08641.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08641.is_deleted} = false ;;
}
