# Update for 2000 file diff target
# Explore: explore_3578
# Auto-generated LookML Explore File

include: "/views/domain_35/view_10735.view.lkml"
include: "/views/domain_37/view_10737.view.lkml"
include: "/views/domain_38/view_10738.view.lkml"
include: "/views/domain_39/view_10739.view.lkml"

explore: explore_3578 {
  label: "Explore Explore 3578"
  description: "Comprehensive analytics explore joining base view_10735 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10735
  
  always_filter: {
    filters: [view_10735.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10735.created_at_date: "7 days"]
    unless: [view_10735.id, view_10735.status]
  }

  join: view_10737 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10735.user_id} = ${view_10737.id} ;;
    required_joins: []
  }

  join: view_10738 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10735.account_id} = ${view_10738.account_id} ;;
    required_joins: [view_10737]
  }

  join: view_10739 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10735.category} = ${view_10739.category} ;;
  }

  access_filter: {
    field: view_10735.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10735.is_deleted} = false ;;
}
