# Explore: explore_0888
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02665.view.lkml"
include: "/views/domain_17/view_02667.view.lkml"
include: "/views/domain_18/view_02668.view.lkml"
include: "/views/domain_19/view_02669.view.lkml"

explore: explore_0888 {
  label: "Explore Explore 0888"
  description: "Comprehensive analytics explore joining base view_02665 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02665
  
  always_filter: {
    filters: [view_02665.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02665.created_at_date: "7 days"]
    unless: [view_02665.id, view_02665.status]
  }

  join: view_02667 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02665.user_id} = ${view_02667.id} ;;
    required_joins: []
  }

  join: view_02668 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02665.account_id} = ${view_02668.account_id} ;;
    required_joins: [view_02667]
  }

  join: view_02669 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02665.category} = ${view_02669.category} ;;
  }

  access_filter: {
    field: view_02665.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02665.is_deleted} = false ;;
}
