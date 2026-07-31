# Update for 500 file diff target
# Explore: explore_3565
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10696.view.lkml"
include: "/views/domain_48/view_10698.view.lkml"
include: "/views/domain_49/view_10699.view.lkml"
include: "/views/domain_50/view_10700.view.lkml"

explore: explore_3565 {
  label: "Explore Explore 3565"
  description: "Comprehensive analytics explore joining base view_10696 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10696
  
  always_filter: {
    filters: [view_10696.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10696.created_at_date: "7 days"]
    unless: [view_10696.id, view_10696.status]
  }

  join: view_10698 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10696.user_id} = ${view_10698.id} ;;
    required_joins: []
  }

  join: view_10699 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10696.account_id} = ${view_10699.account_id} ;;
    required_joins: [view_10698]
  }

  join: view_10700 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10696.category} = ${view_10700.category} ;;
  }

  access_filter: {
    field: view_10696.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10696.is_deleted} = false ;;
}
