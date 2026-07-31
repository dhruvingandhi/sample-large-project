# Update for 2000 file diff target
# Explore: explore_2099
# Auto-generated LookML Explore File

include: "/views/domain_48/view_06298.view.lkml"
include: "/views/domain_50/view_06300.view.lkml"
include: "/views/domain_01/view_06301.view.lkml"
include: "/views/domain_02/view_06302.view.lkml"

explore: explore_2099 {
  label: "Explore Explore 2099"
  description: "Comprehensive analytics explore joining base view_06298 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06298
  
  always_filter: {
    filters: [view_06298.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06298.created_at_date: "7 days"]
    unless: [view_06298.id, view_06298.status]
  }

  join: view_06300 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06298.user_id} = ${view_06300.id} ;;
    required_joins: []
  }

  join: view_06301 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06298.account_id} = ${view_06301.account_id} ;;
    required_joins: [view_06300]
  }

  join: view_06302 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06298.category} = ${view_06302.category} ;;
  }

  access_filter: {
    field: view_06298.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06298.is_deleted} = false ;;
}
