# Update for 2000 file diff target
# Explore: explore_1560
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04681.view.lkml"
include: "/views/domain_33/view_04683.view.lkml"
include: "/views/domain_34/view_04684.view.lkml"
include: "/views/domain_35/view_04685.view.lkml"

explore: explore_1560 {
  label: "Explore Explore 1560"
  description: "Comprehensive analytics explore joining base view_04681 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04681
  
  always_filter: {
    filters: [view_04681.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04681.created_at_date: "7 days"]
    unless: [view_04681.id, view_04681.status]
  }

  join: view_04683 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04681.user_id} = ${view_04683.id} ;;
    required_joins: []
  }

  join: view_04684 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04681.account_id} = ${view_04684.account_id} ;;
    required_joins: [view_04683]
  }

  join: view_04685 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04681.category} = ${view_04685.category} ;;
  }

  access_filter: {
    field: view_04681.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04681.is_deleted} = false ;;
}
