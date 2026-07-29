# Explore: explore_0932
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02797.view.lkml"
include: "/views/domain_49/view_02799.view.lkml"
include: "/views/domain_50/view_02800.view.lkml"
include: "/views/domain_01/view_02801.view.lkml"

explore: explore_0932 {
  label: "Explore Explore 0932"
  description: "Comprehensive analytics explore joining base view_02797 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02797
  
  always_filter: {
    filters: [view_02797.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02797.created_at_date: "7 days"]
    unless: [view_02797.id, view_02797.status]
  }

  join: view_02799 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02797.user_id} = ${view_02799.id} ;;
    required_joins: []
  }

  join: view_02800 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02797.account_id} = ${view_02800.account_id} ;;
    required_joins: [view_02799]
  }

  join: view_02801 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02797.category} = ${view_02801.category} ;;
  }

  access_filter: {
    field: view_02797.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02797.is_deleted} = false ;;
}
