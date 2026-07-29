# Explore: explore_3562
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10687.view.lkml"
include: "/views/domain_39/view_10689.view.lkml"
include: "/views/domain_40/view_10690.view.lkml"
include: "/views/domain_41/view_10691.view.lkml"

explore: explore_3562 {
  label: "Explore Explore 3562"
  description: "Comprehensive analytics explore joining base view_10687 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10687
  
  always_filter: {
    filters: [view_10687.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10687.created_at_date: "7 days"]
    unless: [view_10687.id, view_10687.status]
  }

  join: view_10689 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10687.user_id} = ${view_10689.id} ;;
    required_joins: []
  }

  join: view_10690 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10687.account_id} = ${view_10690.account_id} ;;
    required_joins: [view_10689]
  }

  join: view_10691 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10687.category} = ${view_10691.category} ;;
  }

  access_filter: {
    field: view_10687.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10687.is_deleted} = false ;;
}
