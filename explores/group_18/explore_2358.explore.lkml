# Explore: explore_2358
# Auto-generated LookML Explore File

include: "/views/domain_25/view_07075.view.lkml"
include: "/views/domain_27/view_07077.view.lkml"
include: "/views/domain_28/view_07078.view.lkml"
include: "/views/domain_29/view_07079.view.lkml"

explore: explore_2358 {
  label: "Explore Explore 2358"
  description: "Comprehensive analytics explore joining base view_07075 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07075
  
  always_filter: {
    filters: [view_07075.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07075.created_at_date: "7 days"]
    unless: [view_07075.id, view_07075.status]
  }

  join: view_07077 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07075.user_id} = ${view_07077.id} ;;
    required_joins: []
  }

  join: view_07078 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07075.account_id} = ${view_07078.account_id} ;;
    required_joins: [view_07077]
  }

  join: view_07079 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07075.category} = ${view_07079.category} ;;
  }

  access_filter: {
    field: view_07075.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07075.is_deleted} = false ;;
}
