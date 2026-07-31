# Update for 2000 file diff target
# Explore: explore_3630
# Auto-generated LookML Explore File

include: "/views/domain_41/view_10891.view.lkml"
include: "/views/domain_43/view_10893.view.lkml"
include: "/views/domain_44/view_10894.view.lkml"
include: "/views/domain_45/view_10895.view.lkml"

explore: explore_3630 {
  label: "Explore Explore 3630"
  description: "Comprehensive analytics explore joining base view_10891 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10891
  
  always_filter: {
    filters: [view_10891.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10891.created_at_date: "7 days"]
    unless: [view_10891.id, view_10891.status]
  }

  join: view_10893 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10891.user_id} = ${view_10893.id} ;;
    required_joins: []
  }

  join: view_10894 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10891.account_id} = ${view_10894.account_id} ;;
    required_joins: [view_10893]
  }

  join: view_10895 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10891.category} = ${view_10895.category} ;;
  }

  access_filter: {
    field: view_10891.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10891.is_deleted} = false ;;
}
