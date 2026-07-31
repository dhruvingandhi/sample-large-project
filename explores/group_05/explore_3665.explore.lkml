# Update for 500 file diff target
# Explore: explore_3665
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10996.view.lkml"
include: "/views/domain_48/view_10998.view.lkml"
include: "/views/domain_49/view_10999.view.lkml"
include: "/views/domain_50/view_11000.view.lkml"

explore: explore_3665 {
  label: "Explore Explore 3665"
  description: "Comprehensive analytics explore joining base view_10996 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10996
  
  always_filter: {
    filters: [view_10996.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10996.created_at_date: "7 days"]
    unless: [view_10996.id, view_10996.status]
  }

  join: view_10998 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10996.user_id} = ${view_10998.id} ;;
    required_joins: []
  }

  join: view_10999 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10996.account_id} = ${view_10999.account_id} ;;
    required_joins: [view_10998]
  }

  join: view_11000 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10996.category} = ${view_11000.category} ;;
  }

  access_filter: {
    field: view_10996.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10996.is_deleted} = false ;;
}
