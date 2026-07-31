# Update for 2000 file diff target
# Explore: explore_3560
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10681.view.lkml"
include: "/views/domain_33/view_10683.view.lkml"
include: "/views/domain_34/view_10684.view.lkml"
include: "/views/domain_35/view_10685.view.lkml"

explore: explore_3560 {
  label: "Explore Explore 3560"
  description: "Comprehensive analytics explore joining base view_10681 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10681
  
  always_filter: {
    filters: [view_10681.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10681.created_at_date: "7 days"]
    unless: [view_10681.id, view_10681.status]
  }

  join: view_10683 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10681.user_id} = ${view_10683.id} ;;
    required_joins: []
  }

  join: view_10684 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10681.account_id} = ${view_10684.account_id} ;;
    required_joins: [view_10683]
  }

  join: view_10685 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10681.category} = ${view_10685.category} ;;
  }

  access_filter: {
    field: view_10681.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10681.is_deleted} = false ;;
}
