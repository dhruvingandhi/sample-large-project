# Update for 2000 file diff target
# Explore: explore_3880
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11641.view.lkml"
include: "/views/domain_43/view_11643.view.lkml"
include: "/views/domain_44/view_11644.view.lkml"
include: "/views/domain_45/view_11645.view.lkml"

explore: explore_3880 {
  label: "Explore Explore 3880"
  description: "Comprehensive analytics explore joining base view_11641 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11641
  
  always_filter: {
    filters: [view_11641.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11641.created_at_date: "7 days"]
    unless: [view_11641.id, view_11641.status]
  }

  join: view_11643 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11641.user_id} = ${view_11643.id} ;;
    required_joins: []
  }

  join: view_11644 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11641.account_id} = ${view_11644.account_id} ;;
    required_joins: [view_11643]
  }

  join: view_11645 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11641.category} = ${view_11645.category} ;;
  }

  access_filter: {
    field: view_11641.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11641.is_deleted} = false ;;
}
