# Update for 2000 file diff target
# Explore: explore_0998
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02995.view.lkml"
include: "/views/domain_47/view_02997.view.lkml"
include: "/views/domain_48/view_02998.view.lkml"
include: "/views/domain_49/view_02999.view.lkml"

explore: explore_0998 {
  label: "Explore Explore 0998"
  description: "Comprehensive analytics explore joining base view_02995 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02995
  
  always_filter: {
    filters: [view_02995.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02995.created_at_date: "7 days"]
    unless: [view_02995.id, view_02995.status]
  }

  join: view_02997 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02995.user_id} = ${view_02997.id} ;;
    required_joins: []
  }

  join: view_02998 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02995.account_id} = ${view_02998.account_id} ;;
    required_joins: [view_02997]
  }

  join: view_02999 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02995.category} = ${view_02999.category} ;;
  }

  access_filter: {
    field: view_02995.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02995.is_deleted} = false ;;
}
